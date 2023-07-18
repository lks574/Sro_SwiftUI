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
    @BindingState var searchText: String = ""
  }

  public enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case onTapSearchType(PokemonListPage.SearchView.SortType)

    case getPokeList
    case fetchPokeList(Result<PokemonRepository.PokemonList, ErrorDomain>)
  }

  public var body: some ReducerProtocol<State, Action> {
    BindingReducer()

    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case let .onTapSearchType(type):
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
}
