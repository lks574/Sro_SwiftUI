import Foundation
import ComposableArchitecture
import Domain

public struct PokemonListStore: ReducerProtocol {

  @Dependency(\.appEnvironment) var appEnvironment

  public init() { }

  private var env: PokemonListEnv {
    .init(pokemonUseCase: appEnvironment.pokemonUseCase)
  }

  public struct State: Equatable {

    public init() {}

    var results: PokemonRepository.PokemonList? = .none
    var sortType: PokemonListStore.SortType = .number

    @BindingState var searchText: String = ""
    @BindingState var route: Route? = .none
  }

  public enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case onRouteClear
    case onTapSearchType
    case onChangeSortType(PokemonListStore.SortType)

    case getPokeList
    case fetchPokeList(Result<PokemonRepository.PokemonList, ErrorDomain>)
  }

  public var body: some ReducerProtocol<State, Action> {
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
        return .init(value: .onRouteClear)

      case .onTapSearchType:
        state.route = .sortCard
        return .none

      case .getPokeList:
        return env.getPokemonList()
          .map(Action.fetchPokeList)
          .cancellable(id: CancelID.requestPokemonListID, cancelInFlight: true)

      case .fetchPokeList(let res):
        switch res {
        case let .success(response):
          state.results = response
          return .none
        case let .failure(error):
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
