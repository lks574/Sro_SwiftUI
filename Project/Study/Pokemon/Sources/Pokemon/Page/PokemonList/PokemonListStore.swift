import Foundation
import ComposableArchitecture
import Domain

@Reducer
public struct PokemonListStore {

  @Dependency(\.appEnvironment) var appEnvironment

  public init() { }

  private var env: PokemonListEnv {
    .init(appEnvironment: appEnvironment)
  }

  public struct State: Equatable {

    public init() {}

    var sortType: PokemonListStore.SortType = .number
    var pokeRequest: PokemonRepository.Request.PokemonList = .init(offset: .zero)

    var pokeList: [PokemonRepository.Pokemon] = []

    @BindingState var searchText: String = ""
    @BindingState var route: Route? = .none
  }

  public enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case onRouteClear
    case onTapSearchType
    case onChangeSortType(PokemonListStore.SortType)

    case getPokeList(Int)
    case fetchPokeList(Result<PokemonRepository.PokemonList, ErrorDomain>)
  }

  public var body: some ReducerOf<Self> {
    BindingReducer()

    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .onRouteClear:
        state.route = .none
        return .none

      case let .onChangeSortType(type):
        state.sortType = type
        return .run { await $0(.onRouteClear) }

      case .onTapSearchType:
        state.route = .sortCard
        return .none

      case let .getPokeList(offset):
        state.pokeRequest = state.pokeRequest.mutate(offset: offset)
        return env.getPokemonList(.init(offset: offset))
          .map(Action.fetchPokeList)
          .cancellable(id: CancelID.requestPokemonListID, cancelInFlight: true)

      case .fetchPokeList(let res):
        switch res {
        case let .success(response):
          state.pokeList = state.pokeList + response.pokemons
          return .none
        case .failure:
          return .none
        }
      }
    }
  }
}

extension PokemonListStore {
  private enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestPokemonListID
  }

  enum Route: Equatable {
    case sortCard
  }

  public enum SortType: Equatable {
    case number
    case name
  }
}

extension PokemonRepository.Request.PokemonList {
  fileprivate func mutate(offset: Int) -> Self {
    .init(offset: offset, limit: limit)
  }
}
